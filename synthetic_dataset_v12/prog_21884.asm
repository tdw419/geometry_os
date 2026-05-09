; DESCRIPTION: Places a cyan line segment connecting (346, 230) to (15, 50).
; PLAN: r0=346(x1), r1=230(y1), r2=15(x2), r3=50(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 230
LDI r2, 15
LDI r3, 50
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
