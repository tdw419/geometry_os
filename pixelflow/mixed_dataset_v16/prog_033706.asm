; DESCRIPTION: Places a cyan 55x53 rectangle at position (209, 103).
; PLAN: r0=209(x), r1=103(y), r2=55(width), r3=53(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 103
LDI r2, 55
LDI r3, 53
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
