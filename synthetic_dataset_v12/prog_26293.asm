; DESCRIPTION: Places a orange 98x39 rectangle at position (368, 215).
; PLAN: r0=368(x), r1=215(y), r2=98(width), r3=39(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 215
LDI r2, 98
LDI r3, 39
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
