; DESCRIPTION: Draws a cyan line from (442, 20) to (346, 104).
; PLAN: r0=442(x1), r1=20(y1), r2=346(x2), r3=104(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 442
LDI r1, 20
LDI r2, 346
LDI r3, 104
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
