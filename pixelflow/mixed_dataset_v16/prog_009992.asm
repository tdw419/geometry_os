; DESCRIPTION: Renders a red box of size 103x11 starting at (389, 111).
; PLAN: r0=389(x), r1=111(y), r2=103(width), r3=11(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 111
LDI r2, 103
LDI r3, 11
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
