; DESCRIPTION: Places a cyan line segment connecting (64, 215) to (157, 166).
; PLAN: r0=64(x1), r1=215(y1), r2=157(x2), r3=166(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 215
LDI r2, 157
LDI r3, 166
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
