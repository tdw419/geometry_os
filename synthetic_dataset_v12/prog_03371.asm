; DESCRIPTION: Places a red 67x77 rectangle at position (445, 137).
; PLAN: r0=445(x), r1=137(y), r2=67(width), r3=77(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 445
LDI r1, 137
LDI r2, 67
LDI r3, 77
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
