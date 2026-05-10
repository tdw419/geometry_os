; DESCRIPTION: Places a cyan 103x100 rectangle at position (74, 54).
; PLAN: r0=74(x), r1=54(y), r2=103(width), r3=100(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 54
LDI r2, 103
LDI r3, 100
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
