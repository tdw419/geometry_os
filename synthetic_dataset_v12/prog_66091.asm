; DESCRIPTION: Places a yellow 76x59 rectangle at position (253, 187).
; PLAN: r0=253(x), r1=187(y), r2=76(width), r3=59(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 187
LDI r2, 76
LDI r3, 59
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
