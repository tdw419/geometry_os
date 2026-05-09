; DESCRIPTION: Draws a cyan line from (469, 164) to (365, 12).
; PLAN: r0=469(x1), r1=164(y1), r2=365(x2), r3=12(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 469
LDI r1, 164
LDI r2, 365
LDI r3, 12
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
