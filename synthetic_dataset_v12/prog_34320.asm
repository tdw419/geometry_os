; DESCRIPTION: Places a red 72x98 rectangle at position (405, 127).
; PLAN: r0=405(x), r1=127(y), r2=72(width), r3=98(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 127
LDI r2, 72
LDI r3, 98
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
