; DESCRIPTION: Places a red 103x70 rectangle at position (380, 37).
; PLAN: r0=380(x), r1=37(y), r2=103(width), r3=70(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 37
LDI r2, 103
LDI r3, 70
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
