; DESCRIPTION: Renders a red box of size 57x86 starting at (144, 133).
; PLAN: r0=144(x), r1=133(y), r2=57(width), r3=86(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 133
LDI r2, 57
LDI r3, 86
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
