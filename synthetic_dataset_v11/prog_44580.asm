; DESCRIPTION: Places a cyan 29x45 rectangle at position (202, 5).
; PLAN: r0=202(x), r1=5(y), r2=29(width), r3=45(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 5
LDI r2, 29
LDI r3, 45
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
