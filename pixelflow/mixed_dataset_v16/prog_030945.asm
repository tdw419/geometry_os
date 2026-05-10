; DESCRIPTION: Renders a cyan box of size 55x46 starting at (320, 36).
; PLAN: r0=320(x), r1=36(y), r2=55(width), r3=46(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 36
LDI r2, 55
LDI r3, 46
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
