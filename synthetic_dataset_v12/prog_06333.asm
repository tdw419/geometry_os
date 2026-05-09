; DESCRIPTION: Renders a red box of size 42x59 starting at (193, 111).
; PLAN: r0=193(x), r1=111(y), r2=42(width), r3=59(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 111
LDI r2, 42
LDI r3, 59
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
