; DESCRIPTION: Draws a cyan line from (434, 44) to (333, 120).
; PLAN: r0=434(x1), r1=44(y1), r2=333(x2), r3=120(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 434
LDI r1, 44
LDI r2, 333
LDI r3, 120
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
