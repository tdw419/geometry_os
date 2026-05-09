; DESCRIPTION: Draws a cyan line from (445, 21) to (206, 199).
; PLAN: r0=445(x1), r1=21(y1), r2=206(x2), r3=199(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 445
LDI r1, 21
LDI r2, 206
LDI r3, 199
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
