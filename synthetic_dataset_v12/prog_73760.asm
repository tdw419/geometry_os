; DESCRIPTION: Renders a red box of size 103x86 starting at (68, 90).
; PLAN: r0=68(x), r1=90(y), r2=103(width), r3=86(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 90
LDI r2, 103
LDI r3, 86
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
