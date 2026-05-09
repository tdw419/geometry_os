; DESCRIPTION: Places a cyan 120x21 rectangle at position (216, 0).
; PLAN: r0=216(x), r1=0(y), r2=120(width), r3=21(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 0
LDI r2, 120
LDI r3, 21
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
