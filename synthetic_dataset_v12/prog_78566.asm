; DESCRIPTION: Places a cyan 111x53 rectangle at position (9, 162).
; PLAN: r0=9(x), r1=162(y), r2=111(width), r3=53(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 162
LDI r2, 111
LDI r3, 53
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
