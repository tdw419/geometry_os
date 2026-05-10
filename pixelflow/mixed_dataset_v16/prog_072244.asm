; DESCRIPTION: Places a red 82x111 rectangle at position (167, 124).
; PLAN: r0=167(x), r1=124(y), r2=82(width), r3=111(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 124
LDI r2, 82
LDI r3, 111
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
