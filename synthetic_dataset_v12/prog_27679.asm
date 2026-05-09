; DESCRIPTION: Renders a green box of size 78x79 starting at (415, 30).
; PLAN: r0=415(x), r1=30(y), r2=78(width), r3=79(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 30
LDI r2, 78
LDI r3, 79
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
