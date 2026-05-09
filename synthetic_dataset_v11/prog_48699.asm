; DESCRIPTION: Renders a cyan box of size 58x61 starting at (68, 104).
; PLAN: r0=68(x), r1=104(y), r2=58(width), r3=61(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 104
LDI r2, 58
LDI r3, 61
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
