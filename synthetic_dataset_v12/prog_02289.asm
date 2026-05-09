; DESCRIPTION: Places a green 102x39 rectangle at position (18, 134).
; PLAN: r0=18(x), r1=134(y), r2=102(width), r3=39(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 134
LDI r2, 102
LDI r3, 39
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
