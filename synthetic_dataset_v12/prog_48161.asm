; DESCRIPTION: Places a cyan line segment connecting (417, 42) to (488, 15).
; PLAN: r0=417(x1), r1=42(y1), r2=488(x2), r3=15(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 42
LDI r2, 488
LDI r3, 15
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
