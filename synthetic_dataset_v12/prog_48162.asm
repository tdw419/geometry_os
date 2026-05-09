; DESCRIPTION: Renders a green box of size 95x95 starting at (360, 113).
; PLAN: r0=360(x), r1=113(y), r2=95(width), r3=95(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 113
LDI r2, 95
LDI r3, 95
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
