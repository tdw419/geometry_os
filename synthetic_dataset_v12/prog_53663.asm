; DESCRIPTION: Renders a red box of size 75x115 starting at (173, 126).
; PLAN: r0=173(x), r1=126(y), r2=75(width), r3=115(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 126
LDI r2, 75
LDI r3, 115
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
