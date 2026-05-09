; DESCRIPTION: Renders a red box of size 55x26 starting at (320, 164).
; PLAN: r0=320(x), r1=164(y), r2=55(width), r3=26(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 164
LDI r2, 55
LDI r3, 26
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
