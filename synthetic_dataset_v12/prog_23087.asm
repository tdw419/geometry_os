; DESCRIPTION: Places a white 80x117 rectangle at position (45, 39).
; PLAN: r0=45(x), r1=39(y), r2=80(width), r3=117(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 39
LDI r2, 80
LDI r3, 117
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
