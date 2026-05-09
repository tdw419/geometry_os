; DESCRIPTION: Places a purple 48x17 rectangle at position (126, 173).
; PLAN: r0=126(x), r1=173(y), r2=48(width), r3=17(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 173
LDI r2, 48
LDI r3, 17
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
