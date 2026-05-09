; DESCRIPTION: Renders a red box of size 33x60 starting at (464, 167).
; PLAN: r0=464(x), r1=167(y), r2=33(width), r3=60(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 464
LDI r1, 167
LDI r2, 33
LDI r3, 60
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
