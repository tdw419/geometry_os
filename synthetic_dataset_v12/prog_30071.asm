; DESCRIPTION: Places a black 120x54 rectangle at position (191, 173).
; PLAN: r0=191(x), r1=173(y), r2=120(width), r3=54(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 173
LDI r2, 120
LDI r3, 54
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
