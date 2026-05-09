; DESCRIPTION: Renders a cyan box of size 96x28 starting at (239, 206).
; PLAN: r0=239(x), r1=206(y), r2=96(width), r3=28(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 206
LDI r2, 96
LDI r3, 28
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
