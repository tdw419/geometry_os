; DESCRIPTION: Places a green 24x33 rectangle at position (93, 210).
; PLAN: r0=93(x), r1=210(y), r2=24(width), r3=33(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 210
LDI r2, 24
LDI r3, 33
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
