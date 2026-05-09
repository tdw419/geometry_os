; DESCRIPTION: Places a green 102x28 rectangle at position (107, 225).
; PLAN: r0=107(x), r1=225(y), r2=102(width), r3=28(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 225
LDI r2, 102
LDI r3, 28
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
