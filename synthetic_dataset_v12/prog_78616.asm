; DESCRIPTION: Places a red 98x120 rectangle at position (393, 62).
; PLAN: r0=393(x), r1=62(y), r2=98(width), r3=120(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 62
LDI r2, 98
LDI r3, 120
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
