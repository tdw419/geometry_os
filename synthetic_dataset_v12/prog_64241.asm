; DESCRIPTION: Places a cyan 13x16 rectangle at position (148, 202).
; PLAN: r0=148(x), r1=202(y), r2=13(width), r3=16(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 202
LDI r2, 13
LDI r3, 16
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
