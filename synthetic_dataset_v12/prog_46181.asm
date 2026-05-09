; DESCRIPTION: Places a green 120x17 rectangle at position (148, 239).
; PLAN: r0=148(x), r1=239(y), r2=120(width), r3=17(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 239
LDI r2, 120
LDI r3, 17
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
