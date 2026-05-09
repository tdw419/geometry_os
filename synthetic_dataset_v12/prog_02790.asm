; DESCRIPTION: Renders a red box of size 103x68 starting at (239, 29).
; PLAN: r0=239(x), r1=29(y), r2=103(width), r3=68(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 29
LDI r2, 103
LDI r3, 68
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
