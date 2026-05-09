; DESCRIPTION: Places a green 12x19 rectangle at position (214, 48).
; PLAN: r0=214(x), r1=48(y), r2=12(width), r3=19(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 48
LDI r2, 12
LDI r3, 19
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
