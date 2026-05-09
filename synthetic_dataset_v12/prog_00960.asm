; DESCRIPTION: Renders a cyan box of size 64x62 starting at (352, 83).
; PLAN: r0=352(x), r1=83(y), r2=64(width), r3=62(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 83
LDI r2, 64
LDI r3, 62
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
