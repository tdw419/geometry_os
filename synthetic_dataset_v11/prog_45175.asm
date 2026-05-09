; DESCRIPTION: Renders a red box of size 42x27 starting at (107, 209).
; PLAN: r0=107(x), r1=209(y), r2=42(width), r3=27(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 209
LDI r2, 42
LDI r3, 27
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
