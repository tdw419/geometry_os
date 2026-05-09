; DESCRIPTION: Renders a magenta box of size 38x86 starting at (280, 47).
; PLAN: r0=280(x), r1=47(y), r2=38(width), r3=86(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 47
LDI r2, 38
LDI r3, 86
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
