; DESCRIPTION: Places a cyan 82x34 rectangle at position (342, 30).
; PLAN: r0=342(x), r1=30(y), r2=82(width), r3=34(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 30
LDI r2, 82
LDI r3, 34
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
