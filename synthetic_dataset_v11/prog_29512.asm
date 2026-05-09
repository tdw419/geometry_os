; DESCRIPTION: Renders a red box of size 15x64 starting at (150, 180).
; PLAN: r0=150(x), r1=180(y), r2=15(width), r3=64(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 180
LDI r2, 15
LDI r3, 64
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
