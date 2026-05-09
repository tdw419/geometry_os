; DESCRIPTION: Places a red 104x30 rectangle at position (197, 71).
; PLAN: r0=197(x), r1=71(y), r2=104(width), r3=30(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 71
LDI r2, 104
LDI r3, 30
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
