; DESCRIPTION: Renders a red box of size 12x86 starting at (96, 143).
; PLAN: r0=96(x), r1=143(y), r2=12(width), r3=86(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 143
LDI r2, 12
LDI r3, 86
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
