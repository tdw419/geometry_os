; DESCRIPTION: Places a green 115x19 rectangle at position (332, 174).
; PLAN: r0=332(x), r1=174(y), r2=115(width), r3=19(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 174
LDI r2, 115
LDI r3, 19
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
