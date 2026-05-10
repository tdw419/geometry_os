; DESCRIPTION: Places a yellow 109x76 box at position (173, 183).
; PLAN: r0=173(x), r1=183(y), r2=109(width), r3=76(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 183
LDI r2, 109
LDI r3, 76
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
