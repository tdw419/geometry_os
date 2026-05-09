; DESCRIPTION: Places a cyan 68x15 rectangle at position (141, 208).
; PLAN: r0=141(x), r1=208(y), r2=68(width), r3=15(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 208
LDI r2, 68
LDI r3, 15
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
