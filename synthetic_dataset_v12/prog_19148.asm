; DESCRIPTION: Renders a orange box of size 67x64 starting at (237, 51).
; PLAN: r0=237(x), r1=51(y), r2=67(width), r3=64(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 51
LDI r2, 67
LDI r3, 64
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
