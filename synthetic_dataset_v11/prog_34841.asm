; DESCRIPTION: Renders a magenta box of size 38x28 starting at (210, 186).
; PLAN: r0=210(x), r1=186(y), r2=38(width), r3=28(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 186
LDI r2, 38
LDI r3, 28
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
