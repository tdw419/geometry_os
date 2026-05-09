; DESCRIPTION: Places a red 111x109 rectangle at position (193, 36).
; PLAN: r0=193(x), r1=36(y), r2=111(width), r3=109(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 36
LDI r2, 111
LDI r3, 109
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
