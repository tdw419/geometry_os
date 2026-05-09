; DESCRIPTION: Places a red 111x60 rectangle at position (271, 38).
; PLAN: r0=271(x), r1=38(y), r2=111(width), r3=60(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 38
LDI r2, 111
LDI r3, 60
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
