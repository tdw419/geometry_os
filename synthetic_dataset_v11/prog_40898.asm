; DESCRIPTION: Places a cyan 120x53 rectangle at position (75, 60).
; PLAN: r0=75(x), r1=60(y), r2=120(width), r3=53(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 60
LDI r2, 120
LDI r3, 53
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
