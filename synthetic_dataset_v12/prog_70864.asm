; DESCRIPTION: Places a cyan 53x42 rectangle at position (298, 1).
; PLAN: r0=298(x), r1=1(y), r2=53(width), r3=42(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 1
LDI r2, 53
LDI r3, 42
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
